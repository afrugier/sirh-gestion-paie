package dev.paie.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import dev.paie.config.ServicesConfig;
import dev.paie.entite.Grade;

@ContextConfiguration(classes = { ServicesConfig.class })
@RunWith(SpringRunner.class)
public class GradeServiceJdbcTemplateTest {

	@Autowired
	private GradeService gradeService;
	// @Autowired
	// private DataSource dataSource;
	// private JdbcTemplate jdbcTemplate;

	@Test
	public void test_sauvegarder_lister_mettre_a_jour() {

		Grade grade = new Grade("IT", new BigDecimal(35), new BigDecimal(11.09));
		Grade gradeMAJ = new Grade("IT", new BigDecimal(35), new BigDecimal(25));

		gradeService.sauvegarder(grade);
		assertThat(gradeService.lister().contains(grade));

		gradeService.mettreAJour(gradeMAJ);
		assertThat(gradeService.lister().contains(gradeMAJ));
	}

}
