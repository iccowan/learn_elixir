defmodule TimeNow do

  def now do
    ~s"#{ Time.utc_now }"
  end

end
