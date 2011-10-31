class AttachmentsController < ApplicationController

  # POST /images.json
  def create
    @attachment = Attachment.new(:image => params[:image])
    @attachment.save
    render :json => [@attachment.to_jq_upload].to_json
  end

  # DELETE /images/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    render :json => {:id => @attachment.id}.to_json
  rescue
    logger.info "==============================="
    logger.info "== $!: #{$!} =="
    logger.info "==============================="

    render :text => "", :status => 404
  end

end
