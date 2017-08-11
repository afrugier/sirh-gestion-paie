package dev.paie.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.paie.entite.Entreprise;
import dev.paie.entite.Grade;
import dev.paie.entite.ProfilRemuneration;
import dev.paie.entite.RemunerationEmploye;
import dev.paie.repository.EntreprisesRepository;
import dev.paie.repository.GradeRepository;
import dev.paie.repository.ProfilRemunerationRepository;
import dev.paie.repository.RemunerationEmployeRepository;

@Controller
@RequestMapping("/employes")
public class RemunerationEmployeController {
	@Autowired
	EntreprisesRepository repoEntreprise;
	@Autowired
	ProfilRemunerationRepository repoProfilRemuneration;
	@Autowired
	GradeRepository repoGrade;
	@Autowired
	RemunerationEmployeRepository repoEmploye;

	@RequestMapping(method = RequestMethod.GET, path = "/creer")
	public ModelAndView creerEmploye() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employes/creerEmploye");

		List<Entreprise> listEntreprise = repoEntreprise.findAll();
		mv.addObject("listEntreprise", listEntreprise);

		List<ProfilRemuneration> listProfil = repoProfilRemuneration.findAll();
		mv.addObject("listProfil", listProfil);

		List<Grade> listGrade = repoGrade.findAll();
		mv.addObject("listGrade", listGrade);

		mv.addObject("prefixMatricule", "M00");
		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, path = "/creer")
	protected ModelAndView doPost(HttpServletRequest req) {
		String matricule = req.getParameter("matricule");
		String entrepriseId = req.getParameter("entreprise");
		String profilRemunerationId = req.getParameter("profil");
		String gradeId = req.getParameter("grade");

		Entreprise entreprise = repoEntreprise.findById(Integer.parseInt(entrepriseId));
		ProfilRemuneration profilRemuneration = repoProfilRemuneration.findById(Integer.parseInt(profilRemunerationId));
		Grade grade = repoGrade.findById(Integer.parseInt(gradeId));

		repoEmploye.save(new RemunerationEmploye(matricule, entreprise, profilRemuneration, grade));

		return creerEmploye();

	}

}