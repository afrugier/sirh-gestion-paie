package dev.paie.entite;

import java.time.ZonedDateTime;
import java.time.format.DateTimeFormatter;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class RemunerationEmploye {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	private String matricule;
	@ManyToOne
	private Entreprise entreprise;
	@ManyToOne
	private ProfilRemuneration profilRemuneration;
	@ManyToOne
	private Grade grade;
	private String dateHeureCreation;

	public RemunerationEmploye() {
		super();
	}

	public RemunerationEmploye(String matricule, Entreprise entreprise, ProfilRemuneration profilRemuneration,
			Grade grade) {
		super();
		this.matricule = matricule;
		this.entreprise = entreprise;
		this.profilRemuneration = profilRemuneration;
		this.grade = grade;
		this.dateHeureCreation = DateTimeFormatter.ofPattern("dd/MM/yyyy - hh:mm:ss").format(ZonedDateTime.now());
	}
	public String getMatricule() {
		return matricule;
	}
	public void setMatricule(String matricule) {
		this.matricule = matricule;
	}

	public Entreprise getEntreprise() {
		return entreprise;
	}
	public void setEntreprise(Entreprise entreprise) {
		this.entreprise = entreprise;
	}
	public ProfilRemuneration getProfilRemuneration() {
		return profilRemuneration;
	}
	public void setProfilRemuneration(ProfilRemuneration profilRemuneration) {
		this.profilRemuneration = profilRemuneration;
	}
	public Grade getGrade() {
		return grade;
	}
	public void setGrade(Grade grade) {
		this.grade = grade;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getDateHeureCreation() {
		return dateHeureCreation;
	}

	public void setDateHeureCreation(String dateHeureCreation) {
		this.dateHeureCreation = dateHeureCreation;
	}


}
