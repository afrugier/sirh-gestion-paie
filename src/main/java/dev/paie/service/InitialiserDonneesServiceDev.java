package dev.paie.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Service;

import dev.paie.entite.Cotisation;
import dev.paie.entite.Entreprise;
import dev.paie.entite.Grade;
import dev.paie.entite.ProfilRemuneration;
import dev.paie.repository.CotisationRepository;
import dev.paie.repository.EntreprisesRepository;
import dev.paie.repository.GradeRepository;
import dev.paie.repository.ProfilRemunerationRepository;

@Service
public class InitialiserDonneesServiceDev implements InitialiserDonneesService {

	@Autowired
	private ApplicationContext context;
	@Autowired
	CotisationRepository repoCotisation;
	@Autowired
	EntreprisesRepository repoEntreprise;
	@Autowired
	GradeRepository repoGrade;
	@Autowired
	ProfilRemunerationRepository repoProfilRemuneration;

	@Override
	public void initialiser() {
		Map<String, Cotisation> beansOfTypeCot = context.getBeansOfType(Cotisation.class);
		beansOfTypeCot.values().stream().forEach(c -> repoCotisation.save(c));

		Map<String, Entreprise> beansOfTypeEnt = context.getBeansOfType(Entreprise.class);
		beansOfTypeEnt.values().stream().forEach(e -> repoEntreprise.save(e));

		Map<String, Grade> beansOfTypeGra = context.getBeansOfType(Grade.class);
		beansOfTypeGra.values().stream().forEach(g -> repoGrade.save(g));

		Map<String, ProfilRemuneration> beansOfTypePro = context.getBeansOfType(ProfilRemuneration.class);
		beansOfTypePro.values().stream().forEach(p -> repoProfilRemuneration.save(p));
	}


}
