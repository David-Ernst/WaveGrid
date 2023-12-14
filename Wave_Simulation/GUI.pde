import javax.swing.SwingUtilities;
import java.util.concurrent.CountDownLatch;

class GUI {
  public ControlFrame controlFrame;

  GUI() {
    // Create a CountDownLatch with initial count 1
    CountDownLatch latch = new CountDownLatch(1);

    createControlFrame(latch);

    try {
      // Wait for the latch to count down to zero
      latch.await();
    }
    catch (InterruptedException e) {
      e.printStackTrace();
    }
  }

  public void createControlFrame(CountDownLatch latch) {
    SwingUtilities.invokeLater(() -> {
      // Check if the controlFrame is already initialized
      if (this.controlFrame == null) {
        this.controlFrame = new ControlFrame();
        this.controlFrame.setVisible(true);
        this.controlFrame.toFront();
      }

      // Count down the latch to signal completion
      latch.countDown();
    }
    );
  }
}
