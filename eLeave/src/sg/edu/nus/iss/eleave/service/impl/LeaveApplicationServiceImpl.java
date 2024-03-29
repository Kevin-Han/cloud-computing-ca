package sg.edu.nus.iss.eleave.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import sg.edu.nus.iss.eleave.dao.LeaveApplicationDao;
import sg.edu.nus.iss.eleave.dao.gaeds.LeaveApplicationDAOImpl;
import sg.edu.nus.iss.eleave.dto.LeaveApplication;
import sg.edu.nus.iss.eleave.exception.DAOException;
import sg.edu.nus.iss.eleave.exception.ServiceException;
import sg.edu.nus.iss.eleave.service.LeaveApplicationService;

import com.google.appengine.api.taskqueue.Queue;
import com.google.appengine.api.taskqueue.QueueFactory;
import com.google.appengine.api.taskqueue.TaskOptions;
import com.google.appengine.api.taskqueue.TaskOptions.Method;

public class LeaveApplicationServiceImpl implements LeaveApplicationService {
	
	private static Logger log = Logger.getLogger(LeaveApplicationServiceImpl.class.getCanonicalName());
	
	
	private LeaveApplicationDao leaveApplicationDao = new LeaveApplicationDAOImpl();

	@Override
	public LeaveApplication findLeaveApplicationById(String leaveApplicationId) {
		return leaveApplicationDao.findLeaveApplicationById(leaveApplicationId);
	}

	@Override
	public void insertLeaveApplication(LeaveApplication leaveApplication)  throws ServiceException {
		 try {
			 leaveApplication.setStatus(LeaveApplication.PENDING);
			 leaveApplication.setApplyDate(new Date());
			 leaveApplicationDao.insertLeaveApplication(leaveApplication);
			 //addEmailTask(leaveApplication,"new");
		} catch (DAOException e) {
			log.log(Level.SEVERE, e.getMessage());
			throw new ServiceException();
		}
	}

	@Override
	public String formEmailSubjectToApplicant(LeaveApplication leaveApplication, String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String formEmailContentToApplicant(LeaveApplication leaveApplication, String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String formEmailSubjectToApprover(LeaveApplication leaveApplication, String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String formEmailContentToApprover(LeaveApplication leaveApplication, String type) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void upadateLeaveApplication(LeaveApplication leaveApplication)  throws ServiceException {
		try {
			leaveApplication.setModifyDate(new Date());
			leaveApplication.setStatus(LeaveApplication.PENDING);
			leaveApplicationDao.updateLeaveApplication(leaveApplication);
			//addEmailTask(leaveApplication,"update");
		} catch (DAOException e) {
			log.log(Level.SEVERE, e.getMessage());
			throw new ServiceException();
		}
	}

	@Override
	public void cancelLeaveApplication(LeaveApplication leaveApplication)  throws ServiceException {
		try {
			leaveApplication.setModifyDate(new Date());
			leaveApplication.setStatus(LeaveApplication.CANCELLED);
			leaveApplicationDao.updateLeaveApplication(leaveApplication);
			//addEmailTask(leaveApplication,"update");
		} catch (DAOException e) {
			log.log(Level.SEVERE, e.getMessage());
			throw new ServiceException();
		}
	}
	
	@Override
	public void deleteLeaveApplication(LeaveApplication leaveApplication)  throws ServiceException {
		try {
			leaveApplicationDao.deleteLeaveApplication(leaveApplication);
			//addEmailTask(leaveApplication,"delete");
		} catch (DAOException e) {
			log.log(Level.SEVERE, e.getMessage());
			throw new ServiceException();
		}
	}

	
	private void addEmailTask(LeaveApplication leaveApplication, String type) {
		 Queue queue = QueueFactory.getQueue("EmailQueue");
		 TaskOptions taskOptions = TaskOptions.Builder.withUrl("/email")
		                          .param("leaveApplicationId", leaveApplication.getApplicationId())
		                          .param("notificationType", type)
		                          .method(Method.POST);
		 queue.add(taskOptions);
	}

	@Override
	public void approveApplication(String applicationId) {
		LeaveApplication leaveApplication = findLeaveApplicationById(applicationId);
		try {
			leaveApplication.setStatus(LeaveApplication.APPROVED);
			leaveApplication.setProcessDate(new Date());
			leaveApplicationDao.updateLeaveApplication(leaveApplication);
			//addEmailTask(leaveApplication, "approve");
		} catch (DAOException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
		
	}

	@Override
	public void rejectApplication(String applicationId) {
		LeaveApplication leaveApplication = findLeaveApplicationById(applicationId);
		try {
			leaveApplication.setStatus(LeaveApplication.REJECTED);
			leaveApplication.setProcessDate(new Date());
			leaveApplicationDao.updateLeaveApplication(leaveApplication);
			//addEmailTask(leaveApplication,"reject");
		} catch (DAOException e) {
			log.log(Level.SEVERE, e.getMessage());
		}
	}

	@Override
	public List<LeaveApplication> findAllLeaveApplicationsByCompany(String companyId) {
		return leaveApplicationDao.findAllLeaveApplicationsByCompany(companyId);
	}

	@Override
	public List<LeaveApplication> findAllLeaveApplicationsBySupervisor(String companyId, String supervisorId) {
		return leaveApplicationDao.findAllLeaveApplicationsBySupervisor(companyId, supervisorId);
	}
	
	@Override
	public List<LeaveApplication> findPendingLeaveApplicationsBySupervisor(
			String companyId, String supervisorId) {
		List<LeaveApplication> all = findAllLeaveApplicationsBySupervisor(companyId, supervisorId);
		List<LeaveApplication> pending = new ArrayList<LeaveApplication>();
		for (LeaveApplication application : all) {
			if (LeaveApplication.PENDING.equals(application.getStatus()))
				pending.add(application);
		}
		return pending;
	}

	@Override
	public List<LeaveApplication> findLeaveApplicationsHistoryBySupervisor(
			String companyId, String supervisorId) {
		List<LeaveApplication> all = findAllLeaveApplicationsBySupervisor(companyId, supervisorId);
		List<LeaveApplication> history = new ArrayList<LeaveApplication>();
		for (LeaveApplication application : all) {
			if (!LeaveApplication.PENDING.equals(application.getStatus()))
				history.add(application);
		}
		return history;
	}

	@Override
	public List<LeaveApplication> findAllLeaveApplicationsByEmployee(String companyId, String employeeId) {
		return leaveApplicationDao.findAllLeaveApplicationsByEmployee(companyId, employeeId);
	}

}
