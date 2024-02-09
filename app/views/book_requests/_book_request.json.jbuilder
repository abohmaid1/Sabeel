json.extract! book_request, :id, :requester_id_id, :requested_book_id_id, :meeting_place_id_id, :meeting_time, :created_at, :updated_at
json.url book_request_url(book_request, format: :json)
