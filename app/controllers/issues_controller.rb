class IssuesController < ApplicationController
  def index
    issues = Issue.all
    render json: issues.to_json( :only => [:id, :expected_output, :actual_output, :status, :project_id] )
  end

  def show
    @issue = Issue.find(params[:id])
    render json: @issue.to_json( :only => [:id, :expected_output, :actual_output, :status, :project_id] )
  end

  def create
    issue = Issue.create(issue_params)
    if issue.valid?
      render json: issue
    else
      render json: { errors: issue.errors.full_messages }, status: 422
    end
  end

  def update
    @issue = Issue.find(params[:id])
    @issue.update(issue_params)
    if @issue.save
      render json: @issue
    else
      render json: { errors: issue.errors.full_messages }, status: 422
    end
  end

  def destroy
    issue = Issue.find(params[:id])
    issue.destroy
  end

  private

  def issue_params
    params.require(:issue).permit(:expected_output, :actual_output, :status, :project_id)
  end
end
