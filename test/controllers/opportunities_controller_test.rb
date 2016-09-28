require 'test_helper'

class OpportunitiesControllerTest < ActionController::TestCase
  setup do
    @opportunity = opportunities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:opportunities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create opportunity" do
    assert_difference('Opportunity.count') do
      post :create, opportunity: { activity_description: @opportunity.activity_description, availability: @opportunity.availability, cost_or_offer_option: @opportunity.cost_or_offer_option, date_ini: @opportunity.date_ini, major_id: @opportunity.major_id, number_of_students: @opportunity.number_of_students, ooportunity_title: @opportunity.ooportunity_title, opportunity_cost: @opportunity.opportunity_cost, opportunity_duration: @opportunity.opportunity_duration, opportunity_type: @opportunity.opportunity_type, other_majors: @opportunity.other_majors, question_for_student: @opportunity.question_for_student, receive_portfolio: @opportunity.receive_portfolio, skills_description: @opportunity.skills_description }
    end

    assert_redirected_to opportunity_path(assigns(:opportunity))
  end

  test "should show opportunity" do
    get :show, id: @opportunity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @opportunity
    assert_response :success
  end

  test "should update opportunity" do
    patch :update, id: @opportunity, opportunity: { activity_description: @opportunity.activity_description, availability: @opportunity.availability, cost_or_offer_option: @opportunity.cost_or_offer_option, date_ini: @opportunity.date_ini, major_id: @opportunity.major_id, number_of_students: @opportunity.number_of_students, ooportunity_title: @opportunity.ooportunity_title, opportunity_cost: @opportunity.opportunity_cost, opportunity_duration: @opportunity.opportunity_duration, opportunity_type: @opportunity.opportunity_type, other_majors: @opportunity.other_majors, question_for_student: @opportunity.question_for_student, receive_portfolio: @opportunity.receive_portfolio, skills_description: @opportunity.skills_description }
    assert_redirected_to opportunity_path(assigns(:opportunity))
  end

  test "should destroy opportunity" do
    assert_difference('Opportunity.count', -1) do
      delete :destroy, id: @opportunity
    end

    assert_redirected_to opportunities_path
  end
end
