class NotesController < ApplicationController
  def create
    note = Note.new(note_params)
    note.user_id = current_user.id 
    flash.now[:errors] = note.errors.full_messages if !note.save
    redirect_to track_url(note.track_id)
  end
  
  def destroy
    note = Note.find_by(id: params[:id])
    current_track = note.track
    note.destroy if current_user.id == note.user_id
    redirect_to track_url(current_track)
  end
  private
  def note_params
    params.require(:note).permit(:body, :track_id)
  end
end
