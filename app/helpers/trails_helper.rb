module TrailsHelper

  def isRecurring
     if @trail.recurring?
       "This trail is counting down to the start date: " + @trail.startDate.to_s
     else
       "This trail is ongoing, start anytime"
     end    
  end
  
  def isPublished
     if @trail.status?
       "Live"
     else
       "Draft"
     end    
  end
  
  def publish_trial(strng)
    
        logger.debug "TRAIL!!!!!!!!!!!!publish: did i make a active? #{strng.to_yaml}"
  end
  
end
