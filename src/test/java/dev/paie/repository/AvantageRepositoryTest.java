package dev.paie.repository;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import dev.paie.config.ServicesConfig;
import dev.paie.entite.Avantage;

@ContextConfiguration(classes = { ServicesConfig.class })
@RunWith(SpringRunner.class)
public class AvantageRepositoryTest {

	@Autowired
	private AvantageRepository avantageRepository;

	@Test
	public void test_sauvegarder_lister_mettre_a_jour() {

		Avantage newAvantage = new Avantage("PR", "Prime Annuelle", new BigDecimal(150));
		Avantage avantageMAJ = new Avantage("PR", "Prime Mensuelle", new BigDecimal(100));

		// TODO sauvegarder un nouvel avantage
		avantageRepository.save(newAvantage);
		// TODO vérifier qu'il est possible de récupérer le nouvel avantage via
		// la méthode findOne
		assertThat(avantageRepository.findOne(newAvantage.getId()).equals(newAvantage));
		// TODO modifier un avantage
		Avantage avantageAMAJ = avantageRepository.findOne(newAvantage.getId());
		avantageAMAJ.setId(avantageMAJ.getId());
		avantageAMAJ.setCode(avantageMAJ.getCode());
		avantageAMAJ.setNom(avantageMAJ.getNom());
		avantageAMAJ.setMontant(avantageMAJ.getMontant());
		avantageRepository.save(avantageAMAJ);
		// TODO vérifier que les modifications sont bien prises en compte via la
		// méthode findOne
		assertThat(avantageRepository.findOne(avantageAMAJ.getId()).equals(avantageMAJ));
	}

	@Test
	public void test_findByCode() {
		Avantage avantageMAJ = new Avantage("PR", "Prime Mensuelle", new BigDecimal(100));
		assertThat(avantageRepository.findByCode(avantageMAJ.getCode()).contains(avantageMAJ));
	}

}
