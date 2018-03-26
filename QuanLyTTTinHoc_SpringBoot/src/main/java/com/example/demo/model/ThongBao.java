package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity(name="thongbao")
public class ThongBao {
	
	@Id
	private String maTB;
	//@Temporal(TemporalType.DATE)
	private String dateTB;
	private String tieudeTB, tomtatTB, fileTB, imageTB;
	private int tinhtrang,stt;
	
	public ThongBao() {}
	
	public ThongBao(String maTB, String tieudeTB, String tomtatTB, String dateTB, 
			String imageTB,String fileTB,int tinhtrang, int stt) {
		super();
		this.maTB = maTB;
		this.dateTB = dateTB;
		this.tieudeTB = tieudeTB;
		this.tomtatTB = tomtatTB;
		this.fileTB = fileTB;
		this.imageTB = imageTB;
		this.tinhtrang = tinhtrang;
		this.stt = stt;
	}

	public String getMaTB() {
		return maTB;
	}

	public void setMaTB(String maTB) {
		this.maTB = maTB;
	}

	public String getDateTB() {
		return dateTB;
	}

	public void setDateTB(String dateTB) {
		this.dateTB = dateTB;
	}

	public String getTieudeTB() {
		return tieudeTB;
	}

	public void setTieudeTB(String tieudeTB) {
		this.tieudeTB = tieudeTB;
	}

	public String getTomtatTB() {
		return tomtatTB;
	}

	public void setTomtatTB(String tomtatTB) {
		this.tomtatTB = tomtatTB;
	}

	public String getFileTB() {
		return fileTB;
	}

	public void setFileTB(String fileTB) {
		this.fileTB = fileTB;
	}

	public String getImageTB() {
		return imageTB;
	}

	public void setImageTB(String imageTB) {
		this.imageTB = imageTB;
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
		return "ThongBao [maTB=" + maTB + ", dateTB=" + dateTB + ", tieudeTB=" + tieudeTB + ", tomtatTB=" + tomtatTB
				+ ", fileTB=" + fileTB + ", imageTB=" + imageTB + ", tinhtrang=" + tinhtrang + ", stt=" + stt + "]";
	}
	
	
	
}
