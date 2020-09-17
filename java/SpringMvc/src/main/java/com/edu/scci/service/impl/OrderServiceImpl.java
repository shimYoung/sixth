package com.edu.scci.service.impl;

import java.util.List;
import javax.inject.Inject;
import org.springframework.stereotype.Service;
import com.edu.scci.dao.OrderDAO;
import com.edu.scci.service.OrderService;
import com.edu.scci.vo.BookVO;
import com.edu.scci.vo.OrderDetVO;
import com.edu.scci.vo.OrderVO;

@Service
public class OrderServiceImpl implements OrderService {
	
	@Inject
	private OrderDAO orderDao;

	@Override
	public List<BookVO> getAllBooks() {
		return orderDao.getAllBooks();
	}

	@Override
	public void addOrder(OrderVO order, List<OrderDetVO> orderDets) {
		String ordId = orderDao.getOrderId();
		order.setOrdId(ordId);
		orderDao.addOrder(order);
		for(int i=0; i<orderDets.size(); i++) {
			OrderDetVO det = orderDets.get(i);
			det.setOrdId(ordId);
			det.setUnitPrice(10000);
			orderDao.addDetail(det);
		}
	}
}
