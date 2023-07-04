class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def create
    @note = Note.new(note_params)

    if @note.save
      # Transmitir la nueva nota a través de Turbo Streams
      turbo_stream.append(render_to_string(partial: 'note', locals: { note: @note }))
      @notes = Note.all
      render :index, status: :created
    else
      render :index, status: :unprocessable_entity
    end
  end

  def update
    @note = Note.find(params[:id])

    if @note.update(note_params)
      turbo_stream.update("note_#{params[:id]}", partial: 'note', locals: { note: @note })
      head :ok
    else
      head :unprocessable_entity
    end
  end

  def destroy
    @note = Note.find(params[:id])

    if @note.destroy
      turbo_stream.remove("note_#{params[:id]}")
      head :ok
    else
      head :unprocessable_entity
    end
  end

  private

  def note_params
    params.require(:note).permit(:title, :content)
  end
end
