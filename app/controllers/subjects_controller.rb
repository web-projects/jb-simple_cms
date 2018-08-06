class SubjectsController < ApplicationController

  layout 'admin'

  # WHITELIST APPROACH TO FORCE DEFAULT PAGES TO LOGIN
  before_action  :confirm_logged_in

  before_action :set_subject_count, :only => [:new, :create, :edit, :update]

  def index
    @subjects = Subject.sorted
    #logger.debug("***** subject name=[#{@subjects.find(1).name}] *****")
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new({:name => 'Default'})
    #@subject_count = Subject.count + 1
  end

  def create

    # Instantiate a new object using form parameters
    @subject = Subject.new(subject_params)

    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      flash[:notice] = "Subject '#{@subject.name}' created succesfully."
      redirect_to(subjects_path)
    else
      # If save fails, rediplay the form so user can fix problems
      #@subject_count = Subject.count + 1
      render('new')
    end

  end

  def edit
    @subject = Subject.find(params[:id])
    #@subject_count = Subject.count
  end

  def update

    # Find a new object using form parameters
    @subject = Subject.find(params[:id])

    # Update the object
    if @subject.update_attributes(subject_params)
      flash[:notice] = "Subject '#{@subject.name}' updated succesfully."
      # If save succeeds, redirect to the show action
      redirect_to(subject_path(@subject))
    else
      # If save fails, rediplay the form so user can fix problems
      #@subject_count = Subject.count
      render('edit')
    end

  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Subject '#{@subject.name}' destroyed succesfully."
    redirect_to(subjects_path)
  end

  # ************************************************************************* #
  private
  # ************************************************************************* #

  def subject_params
    params.require(:subject).permit(:name, :position, :visible, :created_at)
  end

  def set_subject_count
    @subject_count = Subject.count
    if(params[:action] == 'new' || params[:action] == 'create')
      @subject_count += 1
    end
  end


end
