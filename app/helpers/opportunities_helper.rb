module OpportunitiesHelper

  def opportunity_majors_by_comma
    if @opportunity.other_majors
      'Todas las carreras'
    else
      @opportunity.majors.map{ |m| m.major_name }.join(', ')
    end
  end

  def opportunities_header_color
    if current_user.role_id == User::ROLE_STUDENT
      'students-show-view-header'
    elsif current_user.role_id == User::ROLE_COMPANY
      'companies-signup-header'
    elsif current_user.role_id == User::ROLE_PERSON
      'people-signup-header'
    end
  end

  def opportunities_tab_content_color
    if user_signed_in?
      if current_user.role_id == User::ROLE_COMPANY
        'company-tab-content'
      elsif current_user.role_id == User::ROLE_PERSON
        'person-tab-content'
      elsif current_user.role_id == User::ROLE_STUDENT
        'company-tab-content student-title-blue'
      end
    else
      ''
    end
  end

  # Helper method for building rails helper select from constants declared in the model
  def company_opportunity_select_type
    [
        ['Proyecto virtual', Opportunity::TYPE_VIRTUAL],
        ['Trabajos express', Opportunity::TYPE_SEASONAL],
        ['Empleo temporal', Opportunity::TYPE_ON_SITE],
        ['Empleo', Opportunity::TYPE_FIRST_JOB],
        ['Práctica', Opportunity::TYPE_PRACTICE]
    ]
  end

  def person_opportunity_select_type
    [
        ['Proyecto virtual', Opportunity::TYPE_VIRTUAL],
        ['Trabajos express', Opportunity::TYPE_SEASONAL],
        ['Empleo temporal', Opportunity::TYPE_ON_SITE],
        ['Empleo', Opportunity::TYPE_FIRST_JOB],
        ['Práctica', Opportunity::TYPE_PRACTICE]
    ]
  end

  # Helper method to display friendly name instead of select value
  def opportunity_type_friendly(opportunity)
    if opportunity.opportunity_type == Opportunity::TYPE_VIRTUAL
      'Proyecto virtual'
    elsif opportunity.opportunity_type == Opportunity::TYPE_ON_SITE
      'Empleo temporal'
    elsif opportunity.opportunity_type == Opportunity::TYPE_PRACTICE
      'Práctica'
    elsif opportunity.opportunity_type == Opportunity::TYPE_FIRST_JOB
      'Empleo'
    elsif opportunity.opportunity_type == Opportunity::TYPE_SEASONAL
      'Trabajos express'
    end
  end

  # Helper method for building rails helper select from constants declared in the model
  def opportunity_select_availability
    [
        ['Tiempo completo', Opportunity::AVAILABILITY_FULL_TIME],
        ['Medio tiempo', Opportunity::AVAILABILITY_PART_TIME],
        ['Menos de 20 horas por semana', Opportunity::AVAILABILITY_TWENTY_HOURS]
    ]
  end

  # Helper method to display friendly name instead of select value
  def opportunity_availability_friendly(opportunity)
    if opportunity.availability == 0
      'Tiempo completo'
    elsif opportunity.availability == 1
      'Medio tiempo'
    elsif opportunity.availability == 2
      'Menos de 20 horas por semana'
    end
  end

  # Helper method for building rails helper select from constants declared in the model
  def opportunity_select_cost_or_offer
    [
        ['Quiero poner un valor para el proyecto', Opportunity::OPTION_FOR_COST],
        ['Quiero escuchar ofertas de los estudiantes', Opportunity::OPTION_FOR_OFFER]
    ]
  end

  # Helper method to display friendly name instead of select value
  def opportunity_cost_or_offer_friendly(opportunity)
    if opportunity.cost_or_offer_option == 0
      'Quiero poner un valor para el proyecto'
    else
      'Quiero escuchar ofertas de los estudiantes'
    end
  end

  # Helper method for building rails helper select from constants declared in the model
  def opportunity_date_ini_type_select
    [
        ['Indefinida', Opportunity::TYPE_UNDEFINED],
        ['Lo antes posible', Opportunity::TYPE_AS_SOON_AS_POSSIBLE],
        ['Fijar fecha', Opportunity::TYPE_SET_DATE_INI]
    ]
  end

  # Helper method to display friendly name instead of select value
  def opportunity_date_ini_type_friendly(opportunity)
    if opportunity.date_ini_type == 0
      'Indefinido'
    elsif opportunity.date_ini_type == 1
      'Lo antes posible'
    else
      'Fijar fecha'
    end
  end

  # Helper method for building rails helper select from constants declared in the model
  def opportunity_duration_type_select
    [
        ['Indefinida', Opportunity::OPTION_FOR_DURATION_UNDEFINED],
        ['Fijar duración', Opportunity::OPTION_FOR_DURATION_DEFINED]
    ]
  end

  # Helper method to display friendly name instead of select value
  def opportunity_duration_type_friendly(opportunity)
    if opportunity.opportunity_duration_type == 0
      'Indefinida'
    else
      'Fijar duración'
    end
  end

  def opportunity_salary_friendly(opportunity)
    if opportunity.cost_or_offer_option == Opportunity::OPTION_FOR_OFFER
      'Recibo ofertas'
    else
      opportunity.opportunity_cost
    end
  end

end
