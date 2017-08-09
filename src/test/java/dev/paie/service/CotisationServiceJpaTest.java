package dev.paie.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import dev.paie.entite.Cotisation;
import dev.paie.spring.DataSourceMySQLConfig;
import dev.paie.spring.JpaConfig;

@ContextConfiguration(classes = { CotisationServiceJpa.class, JpaConfig.class, DataSourceMySQLConfig.class })
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

		// TODO sauvegarder une nouvelle cotisation
		cotisationService.sauvegarder(nouvelleCotisation);
		// TODO vérifier qu'il est possible de récupérer la nouvelle cotisation
		// via la méthode lister
		assertThat(cotisationService.lister().contains(nouvelleCotisation));
		// TODO modifier une cotisation
		cotisationService.mettreAJour(cotisationMAJ);
		// TODO vérifier que les modifications sont bien prises en compte via la
		// méthode lister
		assertThat(cotisationService.lister().contains(cotisationMAJ));
	}
}
