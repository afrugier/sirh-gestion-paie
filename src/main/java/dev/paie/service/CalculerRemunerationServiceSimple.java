package dev.paie.service;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import dev.paie.entite.BulletinSalaire;
import dev.paie.entite.Cotisation;
import dev.paie.entite.ResultatCalculRemuneration;
import dev.paie.util.PaieUtils;

@Service
public class CalculerRemunerationServiceSimple implements CalculerRemunerationService {

	@Autowired
	private PaieUtils paieUtil;

	@Override
	public ResultatCalculRemuneration calculer(BulletinSalaire bulletin) {
		BigDecimal salaireDeBase = bulletin.getRemunerationEmploye().getGrade().getNbHeuresBase()
				.multiply(bulletin.getRemunerationEmploye().getGrade().getTauxBase());

		ResultatCalculRemuneration resultat = new ResultatCalculRemuneration();
		resultat.setSalaireDeBase(paieUtil.formaterBigDecimal(salaireDeBase));

		BigDecimal salaireBrut = new BigDecimal(resultat.getSalaireDeBase()).add(bulletin.getPrimeExceptionnelle());
		resultat.setSalaireBrut(paieUtil.formaterBigDecimal(salaireBrut));

		BigDecimal totalRetenueSalarial = bulletin.getRemunerationEmploye().getProfilRemuneration()
				.getCotisationsNonImposables().stream().filter(t -> t.getTauxSalarial() != null)
				.map(Cotisation::getTauxSalarial).reduce(BigDecimal.ZERO, BigDecimal::add).multiply(new BigDecimal(resultat.getSalaireBrut()));
		resultat.setTotalRetenueSalarial(paieUtil.formaterBigDecimal(totalRetenueSalarial));

		BigDecimal totalCotisationsPatronales = bulletin.getRemunerationEmploye().getProfilRemuneration()
				.getCotisationsNonImposables().stream().filter(t -> t.getTauxPatronal() != null)
				.map(Cotisation::getTauxPatronal).reduce(BigDecimal.ZERO, BigDecimal::add)
				.multiply(new BigDecimal(resultat.getSalaireBrut()));
		resultat.setTotalCotisationsPatronales(paieUtil.formaterBigDecimal(totalCotisationsPatronales));

		BigDecimal netImposable = salaireBrut.subtract(new BigDecimal(resultat.getTotalRetenueSalarial()));
		resultat.setNetImposable(paieUtil.formaterBigDecimal(netImposable));

		BigDecimal cotisationImposable = bulletin.getRemunerationEmploye().getProfilRemuneration()
				.getCotisationsImposables().stream().filter(t -> t.getTauxSalarial() != null)
				.map(Cotisation::getTauxSalarial).reduce(BigDecimal.ZERO, BigDecimal::add)
				.multiply(new BigDecimal(resultat.getSalaireBrut()));

		BigDecimal netAPayer = netImposable.subtract(cotisationImposable);
		resultat.setNetAPayer(paieUtil.formaterBigDecimal(netAPayer));

		return resultat;
	}

}
