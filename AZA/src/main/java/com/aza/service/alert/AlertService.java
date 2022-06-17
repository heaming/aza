package com.aza.service.alert;

import java.util.List;
import java.util.Map;

import com.aza.common.Search;
import com.aza.service.domain.Alert;

public interface AlertService {

	public void addAlert(Alert alert) throws Exception;
	
	public void addAlertAttendance(Alert alert) throws Exception;
	
	public void addAlertPayment() throws Exception;
	
	public Alert getAlert(int alertCode) throws Exception;
	
	public void readAlert(int alertCode) throws Exception;
	
	public void deleteAlert(int alertCode) throws Exception;
	
	public Map<String, Object> listAlert(Search search, String receiverId) throws Exception;

	List<Alert> getAlertPayment(Search search, String receiverId) throws Exception;

	List<Alert> getAlertByDate(Search search) throws Exception;
	
}
