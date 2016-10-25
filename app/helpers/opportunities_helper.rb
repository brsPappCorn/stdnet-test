module OpportunitiesHelper

  def opportunity_majors_by_comma
    @opportunity.majors.map{ |m| m.major_name }.join(', ')
  end

  # Helper method for building rails helper select from constants declared in the model
  def opportunity_select_type
    [
        ['Proyecto virtual', Opportunity::TYPE_VIRTUAL],
        ['Proyecto personal', Opportunity::TYPE_PERSONAL],
        ['Práctica', Opportunity::TYPE_PRACTICE],
        ['Primer empleo', Opportunity::TYPE_FIRST_JOB]
    ]
  end

  # Helper method to display friendly name instead of select value
  def opportunity_type_friendly(opportunity)
    if opportunity.opportunity_type == 0
      'Proyecto virtual'
    elsif opportunity.opportunity_type == 1
      'Proyecto presencial'
    elsif opportunity.opportunity_type == 2
      'Práctica'
    else
      'Primer Empleo'
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
    else
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

end
