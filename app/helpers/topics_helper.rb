module TopicsHelper
  def find_youtube_url(youtube_url)
    return "" if youtube_url.blank?
    if youtube_url.include?("youtu.be/")
    video_id = youtube_url.split("youtu.be/").last
    elsif youtube_url.include?("watch?v=")
    video_id = youtube_url.split("watch?v=").last
    else
    video_id = youtube_url
  end
  video_id = video_id[0..10] 
    if video_id.length > 11
    "https://www.youtube.com/embed/#{video_id}"
    end
  end
end