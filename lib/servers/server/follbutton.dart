import 'package:flutter/material.dart';
import 'FollowerService.dart';

class FollowButton extends StatefulWidget {
  final int userId;
  final int providerId;

  const FollowButton({Key? key, required this.userId, required this.providerId})
      : super(key: key);

  @override
  _FollowButtonState createState() => _FollowButtonState();
}

class _FollowButtonState extends State<FollowButton> {
  final FollowerService _followerService = FollowerService();
  late bool _isFollowing;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _initializeFollowingStatus();
  }

  void _initializeFollowingStatus() async {
    _isFollowing = await _followerService.isFollowing(widget.userId, widget.providerId);
    setState(() {}); // تحديث الواجهة بعد جلب حالة المتابعة
  }

  Future<void> _toggleFollow() async {
    setState(() {
      _isLoading = true;
    });

    try {
      if (_isFollowing) {
        await _followerService.unfollowProvider(widget.userId, widget.providerId);
      } else {
        await _followerService.followProvider(widget.userId, widget.providerId);
      }
      // تحديث حالة المتابعة
      setState(() {
        _isFollowing = !_isFollowing;
      });
    } catch (e) {
      print('Error toggling follow status: $e');
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: _isLoading ? null : _toggleFollow,
      style: ElevatedButton.styleFrom(
        backgroundColor: _isFollowing ? Color.fromARGB(255, 138, 127, 238) : const Color(0xFF354B9F),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(opacity: animation, child: child);
        },
        child: _isLoading
            ? const SizedBox(
                height: 15,
                width: 15,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : Row(
                key: ValueKey<bool>(_isFollowing),
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _isFollowing ? 'إلغاء متابعة' : 'متابعة',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4.0),
                  Icon(
                    _isFollowing ? Icons.remove : Icons.add,
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
      ),  
    );
  }
}
