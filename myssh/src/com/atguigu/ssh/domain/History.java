package com.atguigu.ssh.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import org.hibernate.annotations.GenericGenerator;

/**
 * History entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "history", catalog = "myssh")
public class History implements java.io.Serializable {

	// Fields

	private String id;
	private Goods goods;
	private String datetime;
	private String type;
	private double amount;
	private double remain;
	private String user;

	// Constructors

	/** default constructor */
	public History() {
	}

	/** full constructor */
	public History(Goods goods, String datetime, String type, double amount,
			double remain, String user) {
		this.goods = goods;
		this.datetime = datetime;
		this.type = type;
		this.amount = amount;
		this.remain = remain;
		this.user = user;
	}

	// Property accessors
	@GenericGenerator(name = "generator", strategy = "uuid")
	@Id
	@GeneratedValue(generator = "generator")
	@Column(name = "id", unique = true, nullable = false, length = 32)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "goodsid")
	public Goods getGoods() {
		return this.goods;
	}

	public void setGoods(Goods goods) {
		this.goods = goods;
	}

	@Column(name = "datetime", length = 19)
	public String getDatetime() {
		return this.datetime;
	}

	public void setDatetime(String datetime) {
		this.datetime = datetime;
	}

	@Column(name = "_type", length = 6)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "amount", precision = 22, scale = 0)
	public double getAmount() {
		return this.amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	@Column(name = "remain", precision = 22, scale = 0)
	public double getRemain() {
		return this.remain;
	}

	public void setRemain(double remain) {
		this.remain = remain;
	}

	@Column(name = "_user", length = 50)
	public String getUser() {
		return this.user;
	}

	public void setUser(String user) {
		this.user = user;
	}

}