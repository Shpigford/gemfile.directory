module GemfilesHelper
  def gemfile_submitted_by(user)
    concat("Submitted by ")

    tag.span(class: "flex item-center ml-2 space-x-1") do
      concat(image_tag user_image_url(user, size: 32), class: "w-4 h-4 rounded-full")

      concat(
        tag.b do
          if user.x_username.present?
            link_to "@#{user.x_username}", "https://x.com/#{user.x_username}", class: "hover:underline"
          elsif user.github_username.present?
            link_to "@#{user.github_username}", "https://github.com/#{user.github_username}", class: "hover:underline"
          else
            user.name
          end
        end
      )
    end
  end
end
