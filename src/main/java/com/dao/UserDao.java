package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Pay;
import com.bean.Slot;
import com.bean.User;
import com.connection.DBConnection;

public class UserDao {

    public int registerUser(User user) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO users (name, address, mobile_no, email, password, vehicle_no, vehicle_name, vehicle_owner_name) VALUES (?,?,?,?,?,?,?,?)");
            ps.setString(1, user.getName());
            ps.setString(2, user.getAddress());
            ps.setString(3, user.getMobile_no());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getVehicle_no());
            ps.setString(7, user.getVehicle_name());
            ps.setString(8, user.getVehicle_owner_name());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public User CheckUser(String email, String password) {
        User user = new User();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM users WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setVehicle_no(rs.getString("vehicle_no"));
                user.setAddress(rs.getString("address"));
                user.setMobile_no(rs.getString("mobile_no"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public List<Slot> searchSlots(String city) {
        List<Slot> slots = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM slots WHERE city=?");
            ps.setString(1, city);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Slot slot = new Slot();
                slot.setId(rs.getInt("id"));
                slot.setSlotname(rs.getString("slotname"));
                slot.setSlotaddress(rs.getString("slotaddress"));
                slot.setSlotarea(rs.getString("slotarea"));
                slot.setCity(rs.getString("city"));
                slot.setState(rs.getString("state"));
                slot.setCountry(rs.getString("country"));
                slots.add(slot);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return slots;
    }

    public int savePayment(Pay pay) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO payments (email, vehicle_no, slotname, amount, payment_date) VALUES (?,?,?,?,?)");
            ps.setString(1, pay.getEmail());
            ps.setString(2, pay.getVehicle_no());
            ps.setString(3, pay.getSlotname());
            ps.setString(4, pay.getAmount());
            ps.setString(5, pay.getPayment_date());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public List<Pay> getPaymentHistory(String email) {
        List<Pay> payments = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM payments WHERE email=?");
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Pay pay = new Pay();
                pay.setEmail(rs.getString("email"));
                pay.setVehicle_no(rs.getString("vehicle_no"));
                pay.setSlotname(rs.getString("slotname"));
                pay.setAmount(rs.getString("amount"));
                pay.setPayment_date(rs.getString("payment_date"));
                payments.add(pay);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return payments;
    }
}