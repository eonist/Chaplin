import Foundation
import SimpleTimer
/**
 * ## Examples:
 * let to = self.curX + 1
 * let animator = TimeAnimator(duration: 0.3)
 * animator.tick = {
 *    Swift.print("animator.curCount:  \(animator.curCount)")
 *    Swift.print("animator.progress:  \(animator.progress)")
 *    self.curX = TimeAnimator.Interpolate(from: from, to: to, fraction: animator.progress)
 *    self.frame.origin.x self.curX
 * }
 * animator.start()
 * // One-liner:
 * TimeAnimator(duration: 0.3, onChange: { /* Animate stuff */ }, onComplete: { /*Anim completed*/ }).start()
 * - Fixme: ⚠️️ Rather import simpleTimer than include the .swift file
 */
public class TimeAnimator: SimpleTimer {
   internal var curCount: Int = 0
   internal var totalCount: Int { return Int(ceil(duration / (interval))) } // - Fixme: ⚠️️ Rename to maxCount?, we needed to ceil, or else some cases would be zero
   public var duration: TimeInterval // In seconds
   public var onComplete: OnComplete
   public init(duration: TimeInterval, onChange:@escaping OnChange = defaultOnComplete, onComplete:@escaping OnComplete = defaultOnComplete) {
      self.duration = duration
      self.onComplete = onComplete
      super.init(interval: TimeAnimator.fps, repeats: true, onTick: onChange)
   }
}
