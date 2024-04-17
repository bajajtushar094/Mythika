import 'package:get/get.dart';

class SymptomController extends GetxController {
  // low energy
  RxDouble LE_freq = .0.obs;
  RxDouble LE_impact = .0.obs;
  RxInt LE_duration = 0.obs;
  RxInt LE_onset = 0.obs;
  RxInt LE_trigger = 0.obs;
  RxInt LE_condition = 0.obs;
  RxInt LE_worst = 0.obs;
  RxString LE_text = "".obs;

  // periods
  RxInt P_once = 28.obs;
  RxInt P_duration = 6.obs;
  RxInt P_pads = 4.obs;
  RxDouble P_impact = .0.obs;
  RxDouble P_pain = .0.obs;

  //weight changes
  RxDouble W_impact = .0.obs;
  RxInt W_earlier = 0.obs;
  RxInt W_later = 0.obs;
  RxInt W_time = 0.obs;

  // brain fog
  RxDouble B_impact = .0.obs;
  RxString B_note = "".obs;

  // hot flashes
  RxDouble H_intensity = .0.obs;
  RxDouble H_sleep = .0.obs;
  RxDouble H_daily = .0.obs;
  RxInt H_frequency = 0.obs;
  RxBool H_tracking = false.obs;

  // night sweats
  RxDouble N_intensity = .0.obs;
  RxDouble N_sleep = .0.obs;
  RxDouble N_daily = .0.obs;
  RxInt N_frequency = 0.obs;
  RxBool N_tracking = false.obs;

  // vaginal dryness
  RxDouble V_severity = .0.obs;
  RxDouble V_sexual = .0.obs;
  RxDouble V_daily = .0.obs;
  RxInt V_frequency = 0.obs;
  RxInt V_duration = 0.obs;

  // skin rashes
  RxDouble S_well = .0.obs;
  RxDouble S_daily = .0.obs;
  RxInt S_duration = 0.obs;
  RxInt S_size = 4.obs;
  RxInt S_loc = 0.obs;

  // joint discomfort
  RxString J_radiate = "".obs;
  RxString J_relieve = "".obs;
  RxString J_worsen = "".obs;
  RxInt J_pain = 0.obs;
  RxInt J_onset = 0.obs;
  RxInt J_worst = 0.obs;
  RxDouble J_severity = .0.obs;
  RxInt J_hurt = 0.obs;
  RxInt J_char = 0.obs;
}
