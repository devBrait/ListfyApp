import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:listfy_app/utils/constants.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: Constants.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenHeight * 0.02, 
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(screenWidth, screenHeight),
              
              SizedBox(height: screenHeight * 0.035),
              
              _buildSearchField(screenWidth),
              
              SizedBox(height: screenHeight * 0.04),
              
              _buildCardSection(screenWidth, screenHeight),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader(double screenWidth, double screenHeight) {
    return Row(
      children: [
        Container(
          width: screenWidth * 0.12,
          height: screenWidth * 0.12,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Constants.darkPurple, Constants.darkPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Constants.purpleTransparent,
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            FontAwesomeIcons.circleUser,
            color: Constants.lightGray,
            size: screenWidth * 0.07,
          ),
        ),
        
        SizedBox(width: screenWidth * 0.04),
        
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: TextStyle(
                  color: Constants.lightGray,
                  fontSize: screenWidth * 0.045,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                'João!',
                style: TextStyle(
                  color: Constants.white,
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Constants.darkPurple, Constants.darkerPurple],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(
            FontAwesomeIcons.bell,
            color: Constants.lightGray,
            size: screenWidth * 0.06,
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField(double screenWidth) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: Constants.darkPurple,
          width: 1.5,
        ),
      ),
      child: TextField(
        style: TextStyle(
          color: Constants.white,
          fontSize: screenWidth * 0.04,
        ),
        decoration: InputDecoration(
          hintText: 'Search',
          hintStyle: TextStyle(
            color: Constants.mediumGray,
            fontSize: screenWidth * 0.04,
          ),
          prefixIcon: Icon(
            FontAwesomeIcons.magnifyingGlass,
            color: Constants.darkPurple,
            size: screenWidth * 0.06,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: screenWidth * 0.04,
          ),
        ),
      ),
    );
  }

  Widget _buildCardSection(double screenWidth, double screenHeight) {
    return Expanded(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: _buildListCard(
                  icon: Icons.shopping_cart_outlined,
                  title: 'Shop',
                  hasIcon: true,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
              SizedBox(width: screenWidth * 0.02),
              Expanded(
                child: _buildListCard(
                  icon: Icons.list_outlined,
                  title: 'Tasks',
                  hasIcon: false,
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
              SizedBox(width: screenWidth * 0.04),
              _buildAddCard(screenWidth, screenHeight),
            ],
          ),
          
          SizedBox(height: screenHeight * 0.025),
          _buildAllListsCard(screenWidth, screenHeight),
        ],
      ),
    );
  }

  Widget _buildListCard({
    required IconData icon,
    required String title,
    required bool hasIcon,
    required double screenWidth,
    required double screenHeight,
  }) {
    return Container(
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Constants.darkPurple, Constants.darkerPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Constants.darkPurple,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Constants.purpleTransparent,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(screenWidth * 0.02),
              decoration: BoxDecoration(
                color: Constants.purpleTransparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                icon,
                color: Constants.lightGray,
                size: screenWidth * 0.06,
              ),
            ),
            const Spacer(),
            Row(
              children: [
                Expanded(
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Constants.white,
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (hasIcon)
                  Icon(
                    FontAwesomeIcons.star,
                    color: Constants.lightGray,
                    size: screenWidth * 0.05,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddCard(double screenWidth, double screenHeight) {
    return Container(
      width: screenWidth * 0.2,
      height: screenHeight * 0.15,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Constants.darkPurple, Constants.darkerPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Constants.purpleTransparent,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Icon(
        FontAwesomeIcons.plus,
        color: Constants.lightGray,
        size: screenWidth * 0.08,
      ),
    );
  }

  Widget _buildAllListsCard(double screenWidth, double screenHeight) {
    return Container(
      width: double.infinity,
      height: screenHeight * 0.18,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Constants.darkPurple, Constants.darkerPurple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Constants.primaryPurple,
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Constants.purpleTransparent,
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.bars,
                  color: Constants.lightGray,
                  size: screenWidth * 0.1,
                ),
                SizedBox(height: screenHeight * 0.01),
                Text(
                  'See all lists',
                  style: TextStyle(
                    color: Constants.white,
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Manage all your lists here',
                  style: TextStyle(
                    color: Constants.lightGray,
                    fontSize: screenWidth * 0.035,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Constants.purpleTransparent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(
                FontAwesomeIcons.angleRight,
                color: Constants.lightGray,
                size: screenWidth * 0.04,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Constants.darkPurple, Constants.darkerPurple],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        boxShadow: [
          BoxShadow(
            color: Constants.purpleTransparent,
            blurRadius: 15,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          selectedItemColor: Constants.whitePurple,
          unselectedItemColor: Constants.lightGray,
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.house, size: 28),
              activeIcon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Constants.purpleTransparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(FontAwesomeIcons.house, size: 28, color: Constants.whitePurple),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.plus, size: 28),
              activeIcon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Constants.purpleTransparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(FontAwesomeIcons.plus, size: 28, color: Constants.whitePurple),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.gear, size: 28),
              activeIcon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Constants.purpleTransparent,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(FontAwesomeIcons.gear, size: 28, color: Constants.whitePurple),
              ),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}