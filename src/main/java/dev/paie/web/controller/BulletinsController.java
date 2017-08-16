package dev.paie.web.controller;

import java.math.BigDecimal;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.paie.entite.BulletinSalaire;
import dev.paie.entite.Cotisation;
import dev.paie.entite.Periode;
import dev.paie.entite.RemunerationEmploye;
import dev.paie.entite.ResultatCalculRemuneration;
import dev.paie.repository.BulletinRepository;
import dev.paie.repository.CotisationRepository;
import dev.paie.repository.PeriodeRepository;
import dev.paie.repository.ProfilRemunerationRepository;
import dev.paie.repository.RemunerationEmployeRepository;
import dev.paie.service.CalculerRemunerationService;

@Controller
@RequestMapping("/bulletins")
public class BulletinsController {
	@Autowired
	RemunerationEmployeRepository repoEmploye;
	@Autowired
	BulletinRepository repoBulletin;
	@Autowired
	PeriodeRepository repoPeriode;
	@Autowired
	CalculerRemunerationService calculRemuneration;
	@Autowired
	CotisationRepository repoCotisation;
	@Autowired
	ProfilRemunerationRepository repoProfil;

	@RequestMapping(method = RequestMethod.GET, path = "/creerB")
	@Secured("ROLE_ADMINISTRATEUR")
	public ModelAndView creerBuletin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bulletins/creerBulletin");

		List<RemunerationEmploye> listEmployer = repoEmploye.findAll();
		mv.addObject("listEmployer", listEmployer);

		List<Periode> listPeriode = repoPeriode.findAll();
		mv.addObject("listPeriode", listPeriode);

		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, path = "/listerB")
	@Secured({ "ROLE_ADMINISTRATEUR", "ROLE_UTILISATEUR" })
	public ModelAndView listerBulletin() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bulletins/listerBulletin");

		List<BulletinSalaire> listBulletin = repoBulletin.findAll();
		mv.addObject("listBulletin", listBulletin);

		List<ResultatCalculRemuneration> resultatsCalcul = listBulletin.stream()
				.map(b -> calculRemuneration.calculer(b)).collect(Collectors.toList());
		mv.addObject("resultatsCalcul", resultatsCalcul);

		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, path = "/visuB/{id}")
	@Secured({ "ROLE_ADMINISTRATEUR", "ROLE_UTILISATEUR" })
	public ModelAndView visualiserBulletin(@PathVariable("id") Integer id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("bulletins/visualiserBulletin");

		BulletinSalaire bulletin = repoBulletin.findById(id);
		mv.addObject("bulletin", bulletin);


		ResultatCalculRemuneration resultatsCalcul = calculRemuneration.calculer(bulletin);
		mv.addObject("resultatsCalcul", resultatsCalcul);

		List<Cotisation> listCotisationImposable = bulletin.getRemunerationEmploye().getProfilRemuneration()
				.getCotisationsImposables();
		mv.addObject("listCotisationImposable", listCotisationImposable);

		List<Cotisation> listCotisationNomImposable = bulletin.getRemunerationEmploye().getProfilRemuneration()
				.getCotisationsNonImposables();
		mv.addObject("listCotisationNomImposable", listCotisationNomImposable);

		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, path = "/creerB")
	@Secured("ROLE_ADMINISTRATEUR")
	protected String doPostBulletin(HttpServletRequest req) {
		String primeExceptionnelle = req.getParameter("prime");
		String periodeId = req.getParameter("periode");
		String remunerationEmployerId = req.getParameter("matricule");

		Periode periode = repoPeriode.findById(Integer.parseInt(periodeId));
		RemunerationEmploye remunerationEmployer = repoEmploye.findById(Integer.parseInt(remunerationEmployerId));

		repoBulletin.save(new BulletinSalaire(remunerationEmployer, periode, new BigDecimal(primeExceptionnelle)));

		return "redirect:/mvc/bulletins/listerB";

	}

}