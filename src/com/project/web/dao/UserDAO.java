package com.project.web.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Component;

@Component("userDao")
public class UserDAO {
	
	private NamedParameterJdbcTemplate jdbc;


	 @Autowired
	public void setDataSource(DataSource jdbc) {
		this.jdbc = new NamedParameterJdbcTemplate(jdbc);
	}

	public List<User> getUsers() {

		return jdbc.query("select * from User", new RowMapper<User>() {
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User u = new User();
				u.setId(rs.getInt("idUser"));
				u.setName(rs.getString("NAME"));
				u.setSurname(rs.getString("SURNAME"));
				u.setAge(rs.getInt("AGE"));
				u.setGender(rs.getString("GENDER"));
				u.setAddress(rs.getString("ADDRESS"));
				return u;
			}
		});
	}

	public List<User> getUsersByName(String name) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("name", name);
		return jdbc.query("select * from User where NAME=:name",params, new RowMapper<User>() {
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User u = new User();
				u.setId(rs.getInt("idUser"));
				u.setName(rs.getString("NAME"));
				u.setSurname(rs.getString("SURNAME"));
				u.setAge(rs.getInt("AGE"));
				u.setGender(rs.getString("GENDER"));
				u.setAddress(rs.getString("ADDRESS"));
				return u;
			}
		});
	}

	public User getUserById(int id) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", id);
		return jdbc.queryForObject("select * from User where ID = :id", params, new RowMapper<User>() {
			@Override
			public User mapRow(ResultSet rs, int rowNum) throws SQLException {
				User u = new User();
				u.setId(rs.getInt(0));
				u.setName(rs.getString(1));
				u.setSurname(rs.getString(2));
				u.setAge(rs.getInt(3));
				u.setGender(rs.getString(4));
				u.setAddress(rs.getString(5));
				return u;
			}
		});
	}

	public boolean createUser(User user) {
		BeanPropertySqlParameterSource params = new BeanPropertySqlParameterSource(user);

		return jdbc.update("insert into User (NAME,SURNAME,AGE,GENDER,ADDRESS) values (:name,:surname,:age,:gender,:address)",params) == 1;
	}

	public int delete(int id) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", id);
		return jdbc.update("delete from User where idUser=:id", params);
	}
	public int update(User u) {
		MapSqlParameterSource params = new MapSqlParameterSource();
		params.addValue("id", u.getId());
		params.addValue("name", u.getName());
		params.addValue("surname", u.getSurname());
		params.addValue("gender", u.getGender());
		params.addValue("address", u.getAddress());
		params.addValue("age", u.getAge());
		return jdbc.update("update User set NAME=:name,SURNAME=:surname,AGE=:age,GENDER=:gender,ADDRESS=:address where idUser=:id", params);
	}

}
