package cn.gdou.xsgz.util;

import java.beans.PropertyDescriptor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

//                            _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                   佛祖镇楼                    BUG辟易

/**
 * 数据库操作类:<br>
 * 重写org.apache.commons.dbutils.QueryRunner的所有方法,避免 try,catch的麻烦
 * 
 * @author 李楚富
 * @version 2014-04-22
 */
public class MyQueryRunner extends QueryRunner{
	public MyQueryRunner() {
	}
	public MyQueryRunner(DataSource ds){
		super(ds);
	}
	
	
	@Override
	public int[] batch(Connection conn, String sql, Object[][] params){
		try {
			return super.batch(conn, sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
	}
	
	@Override
	public int[] batch(String sql, Object[][] params){
		try {
			return super.batch(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	protected void close(Connection conn) {
		try {
			super.close(conn);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	protected void close(ResultSet rs){
		try {
			super.close(rs);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
	}

	@Override
	protected void close(Statement stmt){
		try {
			super.close(stmt);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
	}

	@Override
	public void fillStatement(PreparedStatement stmt, Object... params)
			{
		try {
			super.fillStatement(stmt, params);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public void fillStatementWithBean(PreparedStatement stmt, Object bean,
            PropertyDescriptor[] properties){
		try {
			super.fillStatementWithBean(stmt, bean, properties);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public void fillStatementWithBean(PreparedStatement stmt, Object bean,
            String... propertyNames) {
		try {
			super.fillStatementWithBean(stmt, bean, propertyNames);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public DataSource getDataSource() {
		return super.getDataSource();
	}

	@Override
	protected Connection prepareConnection() {
		try {
			return super.prepareConnection();
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	protected PreparedStatement prepareStatement(Connection conn, String sql)
			{
		try {
			return super.prepareStatement(conn, sql);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
	
	}




	public <T> T query(Connection conn, String sql, ResultSetHandler<T> rsh,
            Object... params){
		try {
			return super.query(conn, sql, rsh, params);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public <T> T query(Connection conn, String sql, ResultSetHandler<T> rsh)
			 {
		try {
			return super.query(conn, sql, rsh);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}


	@Override
	public <T> T query(String sql, ResultSetHandler<T> rsh, Object... params)
			 {
		try {
			return super.query(sql, rsh, params);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public <T> T query(String sql, ResultSetHandler<T> rsh){
		try {
			return super.query(sql, rsh);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	protected void rethrow(SQLException cause, String sql, Object... params)
			 {
		try {
			super.rethrow(cause, sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public int update(Connection conn, String sql, Object... params)
			 {
		try {
			return super.update(conn, sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public int update(Connection conn, String sql, Object param)
			 {
		try {
			return super.update(conn, sql, param);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public int update(Connection conn, String sql) {
		try {
			return super.update(conn, sql);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public int update(String sql, Object... params){
		try {
			return super.update(sql, params);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public int update(String sql, Object param){
		try {
			return super.update(sql, param);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	public int update(String sql) {
		try {
			return super.update(sql);
		} catch (SQLException e) {
			throw new RuntimeException(e.getMessage(),e);
		}
		
	}

	@Override
	protected ResultSet wrap(ResultSet rs) {
		return super.wrap(rs);
	}
	
}