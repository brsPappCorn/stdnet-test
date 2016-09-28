module OpportunitiesHelper

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
      'Proyecto personal'
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

end
