package dev.paie.service;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import dev.paie.entite.Grade;

@Service
public class GradeServiceJdbcTemplate implements GradeService {

	private JdbcTemplate jdbcTemplate;

	@Autowired
	public GradeServiceJdbcTemplate(DataSource dataSource) {
		super();
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public void sauvegarder(Grade nouveauGrade) {
		String sql = "INSERT INTO `grade`(`code`, `nbHeuresBases`, `tauxBase`) VALUES (? , ? , ?)";
		this.jdbcTemplate.update(sql, nouveauGrade.getCode(), nouveauGrade.getNbHeuresBase(),
				nouveauGrade.getTauxBase());
	}

	@Override
	public void mettreAJour(Grade grade) {
		String sql = "UPDATE `grade` SET `nbHeuresBases`=?,`tauxBase`=? WHERE `code`= ?";
		this.jdbcTemplate.update(sql, grade.getNbHeuresBase(), grade.getTauxBase(), grade.getCode());
	}

	@Override
	public List<Grade> lister() {
		String sql="SELECT * FROM `grade`";
		
		return this.jdbcTemplate.query(sql, (rs, rowNum) -> {
			Grade g = new Grade();
			g.setId(rs.getInt("Id"));
			g.setCode(rs.getString("code"));
			g.setNbHeuresBase(rs.getBigDecimal("nbHeuresBases"));
			g.setTauxBase(rs.getBigDecimal("tauxBase"));
			return g;
		});
	}

}
