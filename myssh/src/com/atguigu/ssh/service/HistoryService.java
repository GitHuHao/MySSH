package com.atguigu.ssh.service;

import java.util.List;

import com.atguigu.ssh.domain.Goods;
import com.atguigu.ssh.domain.History;

public interface HistoryService {
	List<History> getAll(Goods goods);
}
