class DownloadsController < ApplicationController
 
  def show
    respond_to do |format|
      format.pdf { send_report_pdf }
 
      if Rails.env.development?
        format.html { render_sample_html }
      end
    end
  end
 
  private
 
  def report
    Report.find(params[:report_id])
  end
 
  def report_pdf
    ReportPdf.new(report)
  end
 
  def send_report_pdf
    send_file report_pdf.to_pdf,
      filename: report_pdf.filename,
      type: "application/pdf",
      disposition: "inline"
  end
 
  def render_sample_html
    render template: "reports/pdf", layout: "report_pdf", locals: { report: report }
  end
end