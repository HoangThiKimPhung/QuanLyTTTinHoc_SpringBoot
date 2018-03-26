package com.example.demo.model;


import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="tintuc")
public class TinTuc{

	@Id
	private String maTT;
	//@Temporal(TemporalType.DATE)
	private String dateTT;
	private String tieudeTT, tomtatTT, fileTT;
	private int tinhtrang,stt;
	
	public TinTuc() {}

	public TinTuc(String maTT, String tieudeTT,String tomtatTT, String dateTT, 
			 String fileTT, int tinhtrang, int stt) {
		this.maTT = maTT;
		this.dateTT = dateTT;
		this.tieudeTT = tieudeTT;
		this.tomtatTT = tomtatTT;
		this.fileTT = fileTT;
		this.tinhtrang = tinhtrang;
		this.stt = stt;
	}

	public String getMaTT() {
		return maTT;
	}

	public void setMaTT(String maTT) {
		this.maTT = maTT;
	}

	public String getDateTT() {
		return dateTT;
	}

	public void setDateTT(String dateTT) {
		this.dateTT = dateTT;
	}

	public String getTieudeTT() {
		return tieudeTT;
	}

	public void setTieudeTT(String tieudeTT) {
		this.tieudeTT = tieudeTT;
	}

	public String getTomtatTT() {
		return tomtatTT;
	}

	public void setTomtatTT(String tomtatTT) {
		this.tomtatTT = tomtatTT;
	}

	public String getFileTT() {
		return fileTT;
	}

	public void setFileTT(String fileTT) {
		this.fileTT = fileTT;
	}

	public int getTinhtrang() {
		return tinhtrang;
	}

	public void setTinhtrang(int tinhtrang) {
		this.tinhtrang = tinhtrang;
	}

	public int getStt() {
		return stt;
	}

	public void setStt(int stt) {
		this.stt = stt;
	}

	@Override
	public String toString() {
		return "TinTuc [maTT=" + maTT + ", dateTT=" + dateTT + ", tieudeTT=" + tieudeTT + ", tomtatTT=" + tomtatTT
				+ ", fileTT=" + fileTT + ", tinhtrang=" + tinhtrang + ", stt=" + stt + "]";
	}

	
	
}
