class TicketsController < ApplicationController
  before_filter :find_project
  before_filter :find_ticket, only: [:show, :edit, :update, :destroy]

  def new
    @ticket = @project.tickets.build
  end

  def show

  end

  def edit

  end

  def create
    @ticket = @project.tickets.build(params[:ticket])
    if @ticket.save
      flash[:notice] = "Ticket has been created."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been created."
      render :new
    end
  end

  def update 
    if @ticket.update_attributes(params[:ticket])
      flash[:notice] = "Ticket has been updated."
      redirect_to [@project, @ticket]
    else
      flash[:alert] = "Ticket has not been updated."
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    flash[:notice] = "Ticket has been deleted."
    redirect_to @project
  end

  private
    def find_project
      @project = Project.find(params[:project_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to projects_path, notice: "No project exists"
    end

    def find_ticket
      @ticket = @project.tickets.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      redirect_to @project, notice: "Ticket could not be found."
    end
end
