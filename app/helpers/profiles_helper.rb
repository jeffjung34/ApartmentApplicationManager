module ProfilesHelper
    def roommate_display(profile)
        "<strong>#{profile.name}</strong><span class='text-xs'>
         (Cleanliness: <strong>#{profile.cleanliness}</strong>)
         </span><br/><span class='text-sm'>\"#{profile.biography}\"
         </span>".html_safe
      end
end
