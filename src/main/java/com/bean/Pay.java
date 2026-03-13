package com.bean;

public class Pay {
    private String email, vehicle_no, slotname, amount, payment_date;
    private int id;

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getVehicle_no() { return vehicle_no; }
    public void setVehicle_no(String vehicle_no) { this.vehicle_no = vehicle_no; }

    public String getSlotname() { return slotname; }
    public void setSlotname(String slotname) { this.slotname = slotname; }

    public String getAmount() { return amount; }
    public void setAmount(String amount) { this.amount = amount; }

    public String getPayment_date() { return payment_date; }
    public void setPayment_date(String payment_date) { this.payment_date = payment_date; }
}
