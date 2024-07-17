package airlinereservationsystem;

import java.io.IOException;
import java.util.stream.Stream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;

@WebServlet("/generatePDF")
public class PdfGenerator extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/pdf");
        response.setHeader("Content-Disposition", "attachment; filename=\"BookingDetails.pdf\"");
        Document document = new Document();

        try {
            PdfWriter.getInstance(document, response.getOutputStream());
            document.open();

            // Add logo
            Image logo = Image.getInstance(getServletContext().getRealPath("/air1.jpg"));
            logo.scaleToFit(100, 50);
            logo.setAlignment(Element.ALIGN_CENTER);
            document.add(logo);

            // Add title
            Font titleFont = new Font(Font.FontFamily.HELVETICA, 18, Font.BOLD, new BaseColor(48, 81, 35));
            Paragraph title = new Paragraph("AirLine Systems", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            // Add spacing
            document.add(new Paragraph(" "));

            // Add booking details
            Font sectionFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD | Font.UNDERLINE);
            Font textFont = new Font(Font.FontFamily.HELVETICA, 8, Font.BOLD); // Reduced font size
          
            Paragraph title1 = new Paragraph("Booking Details", sectionFont);
            title1.setAlignment(Element.ALIGN_CENTER);
            document.add(title1);
            document.add(new Paragraph(" "));

            PdfPTable table = new PdfPTable(8); // 8 columns
            table.setWidthPercentage(100); // Full width
           
            table.setSpacingAfter(6f);

            addTableHeader(table);
            addRows(table, request);

            document.add(table);

            // Add payment details
            document.add(new Paragraph("Payment Details", sectionFont));
            document.add(new Paragraph(" "));
            addPaymentDetails(document, request, textFont);
            document.add(new Paragraph(" "));
            Paragraph title2 = new Paragraph(".........Thanks for Booking ! Have a Safe Journey.........", textFont);
            title2.setAlignment(Element.ALIGN_CENTER);
            document.add(title2);
           

        } catch (DocumentException e) {
            e.printStackTrace();
        } finally {
            document.close();
        }
    }

    private void addTableHeader(PdfPTable table) {
        Font headerFont = new Font(Font.FontFamily.HELVETICA,7, Font.BOLD, BaseColor.WHITE); // Reduced font size
        BaseColor headerBackground = new BaseColor(48, 81, 35);
        Stream.of("Username", "Flight Number", "Date of Flight", "No. of Seats", "Ticket Type", "Adults", "Child", "PNR")
                .forEach(columnTitle -> {
                    PdfPCell header = new PdfPCell();
                    header.setPhrase(new Phrase(columnTitle, headerFont));
                    header.setBackgroundColor(headerBackground);
                    header.setHorizontalAlignment(Element.ALIGN_CENTER);
                    header.setPadding(6); // Reduced padding
                    table.addCell(header);
                    header.setBorder(PdfPCell.NO_BORDER); 
                });
    }

    private void addRows(PdfPTable table, HttpServletRequest request) {
        table.addCell(getCell(request.getParameter("username")));
        table.addCell(getCell(request.getParameter("flightNumber")));
        table.addCell(getCell(request.getParameter("dateOfFlight")));
        table.addCell(getCell(request.getParameter("noOfSeats")));
        table.addCell(getCell(request.getParameter("ticketType")));
        table.addCell(getCell(request.getParameter("adults")));
        table.addCell(getCell(request.getParameter("child")));
        table.addCell(getCell(request.getParameter("PNRNumber")));
    }

    private PdfPCell getCell(String text) {
        Font cellFont = new Font(Font.FontFamily.HELVETICA, 7); // Reduced font size
        PdfPCell cell = new PdfPCell(new Phrase(text, cellFont));
        cell.setPadding(6); // Reduced padding
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setBorderColor(BaseColor.GRAY);
        return cell;
    }

    private void addPaymentDetails(Document document, HttpServletRequest request, Font textFont) throws DocumentException {
        document.add(new Paragraph("Address: " + request.getParameter("address"), textFont));
        document.add(new Paragraph("Payment Gateway: " + request.getParameter("gateway1"), textFont));
        document.add(new Paragraph("Transaction ID: " + request.getParameter("tid"), textFont));
        document.add(new Paragraph("Total Amount Paid: " + request.getParameter("actual_fair"), textFont));
    }
    
    
}
