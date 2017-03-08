package _00_init.filter;

//import java.io.ByteArrayOutputStream;
//
//import java.io.OutputStreamWriter;
//import java.io.PrintWriter;

import java.io.IOException;
import javax.servlet.DispatcherType;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
//import javax.servlet.ServletOutputStream;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
//import javax.servlet.WriteListener;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import javax.servlet.http.HttpServletResponseWrapper;

@WebFilter(urlPatterns = { "/*" }, 
             dispatcherTypes = { DispatcherType.REQUEST }
          )

public class DisableCacheFilter implements Filter {
	public void destroy() { }

	public void doFilter(ServletRequest req, ServletResponse resp,
			FilterChain chain) throws IOException, ServletException {
		if (req instanceof HttpServletRequest
				&& resp instanceof HttpServletResponse) {
			HttpServletRequest request = (HttpServletRequest) req;
			HttpServletResponse response = (HttpServletResponse) resp;
			// Notifies cache to obtain a new copy of the page from the
			// origin server
			response.setHeader("Cache-Control", "no-cache");

			// informs cache not to store the content it receives under any
			// circumstance
			response.setHeader("Cache-Control", "no-store");

			// Causes the proxy cache to see the page as "stale",
			// 0 means the expiry date is 1970/01/01 00:00:00 GMT
			response.setDateHeader("Expires", 0);

			// HTTP 1.0 backward compatibility
			response.setHeader("Pragma", "no-cache");

			chain.doFilter(request, response);

		}
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}
	/*
	 * public class HtmlResponseWrapper extends HttpServletResponseWrapper {
	 * 
	 * private final ByteArrayOutputStream capture; private ServletOutputStream
	 * output; private PrintWriter writer;
	 * 
	 * public HtmlResponseWrapper(HttpServletResponse response) {
	 * super(response); capture = new
	 * ByteArrayOutputStream(response.getBufferSize()); }
	 * 
	 * @Override public ServletOutputStream getOutputStream() { if (writer !=
	 * null) { throw new IllegalStateException(
	 * "getWriter() has already been called on this response."); }
	 * 
	 * if (output == null) { output = new ServletOutputStream() {
	 * 
	 * @Override public void write(int b) throws IOException { capture.write(b);
	 * }
	 * 
	 * @Override public void flush() throws IOException { capture.flush(); }
	 * 
	 * @Override public void close() throws IOException { capture.close(); }
	 * 
	 * @Override public boolean isReady() { return false; }
	 * 
	 * @Override public void setWriteListener(WriteListener arg0) { } }; }
	 * 
	 * return output; }
	 * 
	 * @Override public PrintWriter getWriter() throws IOException { if (output
	 * != null) { throw new IllegalStateException(
	 * "getOutputStream() has already been called on this response."); }
	 * 
	 * if (writer == null) { writer = new PrintWriter(new
	 * OutputStreamWriter(capture, getCharacterEncoding())); }
	 * 
	 * return writer; }
	 * 
	 * @Override public void flushBuffer() throws IOException {
	 * super.flushBuffer();
	 * 
	 * if (writer != null) { writer.flush(); } else if (output != null) {
	 * output.flush(); } }
	 * 
	 * public byte[] getCaptureAsBytes() throws IOException { if (writer !=
	 * null) { writer.close(); } else if (output != null) { output.close(); }
	 * 
	 * return capture.toByteArray(); }
	 * 
	 * public String getCaptureAsString() throws IOException { return new
	 * String(getCaptureAsBytes(), getCharacterEncoding()); }
	 * 
	 * }
	 */
}
