package dev.paie.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import dev.paie.config.ServicesConfig;
import dev.paie.entite.Cotisation;

@ContextConfiguration(classes = { ServicesConfig.class })
@RunWith(SpringRunner.class)
public class CotisationServiceJpaTest {
	@Autowired
	private CotisationService cotisationService;

	@Test
	public void test_sauvegarder_lister_mettre_a_jour() {

		Cotisation nouvelleCotisation = new Cotisation("Cot1", "Cotisation Retraite", new BigDecimal(120),
				new BigDecimal(50));
		Cotisation cotisationMAJ = new Cotisation("Cot1", "Cotisation handicape", new BigDecimal(300),
				new BigDecimal(150));

		cotisationService.sauvegarder(nouvelleCotisation);
		assertThat(cotisationService.lister().contains(nouvelleCotisation));

		cotisationService.mettreAJour(cotisationMAJ);
		assertThat(cotisationService.lister().contains(cotisationMAJ));
	}
}
