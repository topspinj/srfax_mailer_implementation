class FaxWorker
  include Sidekiq::Worker

  def perform()
    #TODO second sidekiq job for viewing inbox and passing new faxes one at a time into this job
    faxes = SrFax.view_inbox
    fax = faxes[:Result][0][:FileName] #TODO Create a loop to go through each fax and pass into this job
    #sample fax retrieval
    doc = Document.new
    u = SrFax.get_fax(fax, "IN",{sFaxFormat: "PDF"})
    File.open("Output.pdf", "wb") do |f|
      f.write(Base64.decode64(u[:Result]))
    end
    doc.fax = File.open("Output.pdf")
    doc.save
    File.delete("Output.pdf")
    #SrFax.delete_fax(fax, "IN")
  end
end