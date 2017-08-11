package dev.paie.web.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
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
	@Secured("ROLE_ADMINISTRATEUR")
	public ModelAndView creerEmploye() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employes/creerEmploye");

		List<Entreprise> listEntreprise = repoEntreprise.findAll();
		mv.addObject("listEntreprise", listEntreprise);

		List<ProfilRemuneration> listProfil = repoProfilRemuneration.findAll();
		mv.addObject("listProfil", listProfil);

		List<Grade> listGrade = repoGrade.findAll();
		mv.addObject("listGrade", listGrade);

		return mv;
	}

	@RequestMapping(method = RequestMethod.GET, path = "/lister")
	@Secured({ "ROLE_ADMINISTRATEUR", "ROLE_UTILISATEUR" })
	public ModelAndView listerEmploye() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("employes/listerEmploye");

		List<RemunerationEmploye> listEmploye = repoEmploye.findAll();
		mv.addObject("listEmploye", listEmploye);

		return mv;
	}

	@RequestMapping(method = RequestMethod.POST, path = "/creer")
	@Secured("ROLE_ADMINISTRATEUR")
	protected String doPost(HttpServletRequest req) {
		String matricule = req.getParameter("matricule");
		String entrepriseId = req.getParameter("entreprise");
		String profilRemunerationId = req.getParameter("profil");
		String gradeId = req.getParameter("grade");

		Entreprise entreprise = repoEntreprise.findById(Integer.parseInt(entrepriseId));
		ProfilRemuneration profilRemuneration = repoProfilRemuneration.findById(Integer.parseInt(profilRemunerationId));
		Grade grade = repoGrade.findById(Integer.parseInt(gradeId));

		repoEmploye
				.save(new RemunerationEmploye(matricule, entreprise, profilRemuneration, grade));

		return "redirect:/mvc/employes/lister";

	}

	@RequestMapping(method = RequestMethod.GET, path = "/logout")
	@Secured({ "ROLE_ADMINISTRATEUR", "ROLE_UTILISATEUR" })
	protected String logOut(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) {
			new SecurityContextLogoutHandler().logout(request, response, auth);
		}
		return "redirect:/mvc/connexion?logout";
	}

}