class SponsorNeedsController < ApplicationController

  def back_need
    @student_need = StudentNeed.find(params[:student_need_id])
    @student = @student_need.student
    StudentSponsor.create(student_id: @student, sponsor_id: current_user.id, sponsored: true)
    SponsorNeed.create(student_need_id: @student_need.id)
    binding.pry
    redirect_to student_need_path(@student_need)
  end
end
