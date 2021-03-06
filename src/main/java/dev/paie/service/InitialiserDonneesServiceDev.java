package dev.paie.service;

import java.time.LocalDate;
import java.time.temporal.TemporalAdjusters;
import java.util.Map;
import java.util.stream.IntStream;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import dev.paie.entite.Cotisation;
import dev.paie.entite.Entreprise;
import dev.paie.entite.Grade;
import dev.paie.entite.Periode;
import dev.paie.entite.ProfilRemuneration;
import dev.paie.entite.Utilisateur;
import dev.paie.entite.Utilisateur.ROLES;
import dev.paie.repository.CotisationRepository;
import dev.paie.repository.EntreprisesRepository;
import dev.paie.repository.GradeRepository;
import dev.paie.repository.PeriodeRepository;
import dev.paie.repository.ProfilRemunerationRepository;
import dev.paie.repository.UtilisateurRepository;

@Service
public class InitialiserDonneesServiceDev implements InitialiserDonneesService {

	@Autowired
	private PasswordEncoder passwordEncoder;
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
	@Autowired
	PeriodeRepository repoPeriode;
	@Autowired
	UtilisateurRepository repoUser;

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

		IntStream.range(1, 13).forEach(mois -> {
			Periode p = new Periode();
			p.setDateDebut(LocalDate.of(LocalDate.now().getYear(), mois, 1));
			p.setDateFin(p.getDateDebut().with(TemporalAdjusters.lastDayOfMonth()));
			repoPeriode.save(p);
		});

		repoUser.save(new Utilisateur("admin", passwordEncoder.encode("admin"), true, ROLES.ROLE_ADMINISTRATEUR));
		repoUser.save(
				new Utilisateur("anthony", passwordEncoder.encode("naheulbeuk"), true, ROLES.ROLE_ADMINISTRATEUR));
		repoUser.save(new Utilisateur("thomas", passwordEncoder.encode("thomas"), true, ROLES.ROLE_UTILISATEUR));
	}

}
