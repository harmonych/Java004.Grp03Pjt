package _11_message.controller.fc;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import _11_message.model.fcmessage.FcMessageBean;
import _11_message.model.fcmessage.FcMsgHBNDAO;
import _11_message.model.fcmessage.IFcMessage;

@WebServlet("/_11_message/fcmessage.json")
public class FcMessageJsonServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
	    response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		int fc_id = Integer.parseInt(request.getParameter("fc_id").trim());
		try {
			IFcMessage dao = new FcMsgHBNDAO();
			dao.setFc_id(fc_id);
			List<FcMessageBean> fml = dao.Messagequery(fc_id);
			String msg = new Gson().toJson(fml);			
            out.write(msg);
            out.flush();
		} catch (Exception e) {
			throw new ServletException("DB error", e);
		} finally {
			out.close();
		}
	}
}
