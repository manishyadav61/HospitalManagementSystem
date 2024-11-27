package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDAO {
    private Connection conn;

    public SpecialistDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean addSpecialist(String spec) {
        boolean f = false;
        try {
            String sql = "INSERT INTO specialist(spec_name) VALUES(?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, spec);

            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    public List<Specialist> getAllSpecialist() {
        List<Specialist> list = new ArrayList<>();
        try {
            String sql = "SELECT * FROM specialist";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Specialist s = new Specialist();
                s.setId(rs.getInt("id"));
                s.setSpecialistName(rs.getString("spec_name"));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}
