# Why should we use Slice Timing Correction before Motion Correction?

It is a very intuitive question and definitely Slice Time Correction should be applied before Motion Correction. Although both of the sequences produce errors, applying the Slice Timing Correction first is better. A good explanation is given [here](http://mindhive.mit.edu/node/109).

## 7. At what point in the processing stream should you use it?

    This is the great open question about slice timing, and it's not super-answerable. Both SPM and AFNI recommend you do it before doing realignment/motion correction, but it's not entirely clear why. The issue is this:

* If you do slice timing correction before realignment, you might look down your non-realigned timecourse for a given voxel on the border of gray matter and CSF, say, and see one TR where the head moved and the voxel sampled from CSF instead of gray. This would results in an interpolation error for that voxel, as it would attempt to interpolate part of that big giant signal into the previous voxel.

* On the other hand, if you do realignment before slice timing correction, you might shift a voxel or a set of voxels onto a different slice, and then you'd apply the wrong amount of slice timing correction to them when you corrected - you'd be shifting the signal as if it had come from slice 20, say, when it actually came from slice 19, and shouldn't be shifted as much.

    There's no way to avoid all the error (short of doing a four-dimensional realignment process combining spatial and temporal correction - possibly coming soon), but I believe the current thinking is that doing slice timing first minimizes your possible error. The set of voxels subject to such an interpolation error is small, and the interpolation into another TR will also be small and will only affect a few TRs in the timecourse. By contrast, if one realigns first, many voxels in a slice could be affected at once, and their whole timecourses will be affected. I think that's why it makes sense to do slice timing first. That said, here's some articles from the SPM e-mail list that comment helpfully on this subject both ways, and there are even more if you do a search for "slice timing AND before" in the archives of the list.
