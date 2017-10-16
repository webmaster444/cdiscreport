class Report < ApplicationRecord
end

require "render_anywhere"
 
class ReportPdf
  include RenderAnywhere
 
  def initialize(report)
    @report = report
  end
 
  def to_pdf
    kit = PDFKit.new(as_html, page_size: 'A4')
    kit.to_file("#{Rails.root}/public/report.pdf")
  end
 
  def filename
    "ReportPdf #{report.id}.pdf"
  end
 
  private
 
    attr_reader :report
 
    def as_html
      render template: "reports/pdf", layout: "report_pdf", locals: { report: report }
    end
end
