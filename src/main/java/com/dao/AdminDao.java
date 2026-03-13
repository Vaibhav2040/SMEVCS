package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bean.Pay;
import com.bean.Slot;
import com.connection.DBConnection;

public class AdminDao {

    public boolean checkAdmin(String email, String password) {
        boolean status = false;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM admin WHERE email=? AND password=?");
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int addSlot(Slot slot) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO slots (slotname, slotaddress, slotarea, city, state, country) VALUES (?,?,?,?,?,?)");
            ps.setString(1, slot.getSlotname());
            ps.setString(2, slot.getSlotaddress());
            ps.setString(3, slot.getSlotarea());
            ps.setString(4, slot.getCity());
            ps.setString(5, slot.getState());
            ps.setString(6, slot.getCountry());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public int deleteSlot(int id) {
        int status = 0;
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement(
                "DELETE FROM slots WHERE id=?");
            ps.setInt(1, id);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public List<Slot> getAllSlots() {
        List<Slot> slots = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM slots");
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

    public List<Pay> getAllPayments() {
        List<Pay> payments = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM payments");
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