package dev.paie.service;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;

import javax.sql.DataSource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

import dev.paie.config.ServicesConfig;
import dev.paie.entite.Grade;

@ContextConfiguration(classes = { ServicesConfig.class })
@RunWith(SpringRunner.class)
public class GradeServiceJdbcTemplateTest {

	@Autowired
	private GradeService gradeService;
	@Autowired
	private DataSource dataSource;
	private JdbcTemplate jdbcTemplate;

	// @Before
	// public void init() {
	// this.jdbcTemplate = new JdbcTemplate(dataSource);
	// String sql = "CREATE TABLE IF NOT EXISTS `grade` (`id` int(11)
	// AUTO_INCREMENT, `code` VARCHAR(255),"
	// + "`nbHeuresBases` DECIMAL(10,0), `tauxBase` DECIMAL(10,0), PRIMARY KEY
	// (`id`))";
	// this.jdbcTemplate.execute(sql);
	// }

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
