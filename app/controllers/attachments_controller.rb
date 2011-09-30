class AttachmentsController < ApplicationController

  respond_to :json

  # POST /images.json
  def create
    @attachment = Attachment.new(params[:attachment])
    @attachment.save
    respond_with @attachment
  end

  # DELETE /images/1.json
  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    respond_with @attachment
  end

end
