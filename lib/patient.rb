class Patient
  @@all = []

  attr_accessor :name, :doctor

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def new_appointment(date, doctor)
    app = Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select{|app| app.patient == self}
  end

  def doctors
    self.appointments.map {|app| app.doctor}
  end

end
